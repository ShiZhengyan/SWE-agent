#!/usr/bin/env bash


# This script runs the SWE-bench agent using a specified local host model and evaluates its performance.
# Here we use the specific template that follows XML format, where XML parsing is needed.
set -euo pipefail

# --- user-controlled settings -------------------------------------------------
MODEL_NAME="openai/SWE-smith-32B-Agent_qwen32B_bs1x8_lr5e-5_ep3"     # <-- only change here
USER_RUN_ROOT="trajectories/zhengyanshi@microsoft.com"
OPENAI_API_BASE=http://127.0.0.1:8000/v1
OPENAI_API_KEY=LOCAL
MAX_STEPS=75
MAX_INPUT_TOKENS=24576
MAX_WORKERS=32
CONFIG_FILE="swesmith_infer"
# ------------------------------------------------------------------------------

# Compute slug used inside run directory names, e.g. openai--SWE-bench--SWE-agent-LM-32B
MODEL_SLUG=$(echo "$MODEL_NAME" | sed 's|/|--|g')

# 1. Run the agent batch 3 times
for i in {1..3}; do
  echo "Running agent batch iteration $i/3..."
  sweagent run-batch \
    --num_workers ${MAX_WORKERS} \
    --config agent/${CONFIG_FILE}.yaml \
    --suffix ms${MAX_STEPS}_mit${MAX_INPUT_TOKENS}_as${i} \
    --agent.type max_step \
    --agent.model.name "$MODEL_NAME" \
    --agent.model.api_base "$OPENAI_API_BASE" \
    --agent.model.api_key  "$OPENAI_API_KEY" \
    --agent.model.per_instance_cost_limit 0 \
    --agent.model.total_cost_limit 0 \
    --agent.model.max_input_tokens $MAX_INPUT_TOKENS \
    --agent.max_steps $MAX_STEPS \
    --instances.shuffle True \
    --instances.type swe_bench \
    --instances.subset verified \
    --instances.split test
  
  echo "Completed agent batch iteration $i/3"
done

# 2. Run evaluations for all completed runs
for i in {1..3}; do
  echo "Running evaluation for iteration $i/3..."

  echo "Looking for run directories with pattern: ${USER_RUN_ROOT}/${CONFIG_FILE}__${MODEL_SLUG}*ms${MAX_STEPS}_mit${MAX_INPUT_TOKENS}_as${i}*"

  # Locate the run directory that matches this model and suffix
  RUN_DIR=$(ls -td ${USER_RUN_ROOT}/${CONFIG_FILE}__${MODEL_SLUG}*ms${MAX_STEPS}_mit${MAX_INPUT_TOKENS}_as${i}* 2>/dev/null | head -n1)

  if [[ -z "$RUN_DIR" ]]; then
    echo "Error: no run directory found for model '$MODEL_NAME' iteration $i." >&2
    exit 1
  fi

  echo "Found run directory: $RUN_DIR"

  PREDICTIONS_PATH="${RUN_DIR}/preds.json"

  if [[ ! -f "$PREDICTIONS_PATH" ]]; then
    echo "Error: predictions file not found at '$PREDICTIONS_PATH'." >&2
    echo "Contents of run directory:"
    ls -la "$RUN_DIR"
    exit 1
  fi

  echo "Using predictions from: $PREDICTIONS_PATH"
  echo "File size: $(du -h "$PREDICTIONS_PATH")"

  # 3. Evaluate
  echo "Starting evaluation..."
  if ! python -m swebench.harness.run_evaluation \
      --dataset_name SWE-bench/SWE-bench_Verified \
      --predictions_path "$PREDICTIONS_PATH" \
      --max_workers 24 \
      --run_id swebench_verified_run${i}; then
    echo "Error: Evaluation failed for iteration $i" >&2
    exit 1
  fi
  
  echo "Completed evaluation for iteration $i/3"
done

python run_script/analyze_results.py \
    --results_path . \
    --model_name $MODEL_SLUG