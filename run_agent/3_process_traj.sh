# This is for selecting resolved trajectories to generate the training dataset for the agent

# EVAL_RESULT_FILE is the evaluation result file generated by the agent from `run_agent/run_evaluation.sh`
# The TRAJ_FOLDER is the agent trajectory path
# FOLDER_PATH is used for setting the output folder path
# REPO_NAME is used for setting the output file name

EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4.1__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4.1__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps"
FOLDER_PATH="swesmith_gen_claude__gpt-4.1__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps"
REPO_NAME="astropy__astropy.26d14786"
SWESMITH_TASK_NAME=automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10


EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4o__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4o__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps"
FOLDER_PATH="swesmith_gen_claude__gpt-4o__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps"
REPO_NAME="astropy__astropy.26d14786"
SWESMITH_TASK_NAME=automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10

EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__claude-sonnet-4__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps__ms50_as1/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__claude-sonnet-4__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps__ms50_as1"
FOLDER_PATH="swesmith_gen_claude__claude-sonnet-4__t-0.00__p-1.00__c-2.00___patch_swesmith_astropy__astropy.26d14786_ps__ms50_as1"
REPO_NAME="astropy__astropy.26d14786"
SWESMITH_TASK_NAME=automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10

EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/default__o1__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/default__o1__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps"
FOLDER_PATH="automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10"
REPO_NAME="pylint-dev__pylint.1f8c4d9e"


EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__claude-sonnet-4__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps__ms50_as1/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__claude-sonnet-4__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps__ms50_as1"
FOLDER_PATH="swesmith_gen_claude__claude-sonnet-4__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps__ms50_as1"
REPO_NAME="pylint-dev__pylint.1f8c4d9e"
SWESMITH_TASK_NAME=automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10


EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4o__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps__ms50_as1/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4o__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps__ms50_as1"
FOLDER_PATH="swesmith_gen_claude__gpt-4o__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps__ms50_as1"
REPO_NAME="pylint-dev__pylint.1f8c4d9e"
SWESMITH_TASK_NAME=automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10

EVAL_RESULT_FILE="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4.1__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps/results.json"
TRAJ_FOLDER="trajectories/zhengyanshi@microsoft.com/swesmith_gen_claude__gpt-4.1__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps"
FOLDER_PATH="swesmith_gen_claude__gpt-4.1__t-0.00__p-1.00__c-2.00___patch_swesmith_pylint-dev__pylint.1f8c4d9e_ps"
REPO_NAME="pylint-dev__pylint.1f8c4d9e"
SWESMITH_TASK_NAME=automated_pipeline_o3_bugs30_combos50_depth2_workers32_nbugs1_patches2_perfile2_permodule10

python run_script/process_trajectories_smith.py \
    --eval-file $EVAL_RESULT_FILE \
    --trajectories-folder $TRAJ_FOLDER \
    --folder-path $SWESMITH_TASK_NAME/$FOLDER_PATH \
    --repo-name $REPO_NAME