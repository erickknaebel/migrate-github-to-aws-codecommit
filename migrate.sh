# You can copy and paste this script into shell/cmd window, just be sure to update the
# variables with your specific requirements.

# Setup some variables
migration_dir="./_trash"
git_url="https://github.com/erickknaebel/migrate-github-to-aws.codecommit.git"
aws_region="us-east-2"
codecommit_repo_name="some-repository-name"

# Create the remote repository within CodeCommit
aws codecommit create-repository \
  --repository-name ${codecommit_repo_name} \
  --repository-description "My shiny new CodeCommit repository."

# Clone the remote Github repository to your local machine.
# This is only for migration purposes and is not intended for local development use.
git clone --mirror ${git_url} ${migration_dir}


cd ${migration_dir}

# Push the repository branches to CodeCommit
git push ssh://git-codecommit.${aws_region}.amazonaws.com/v1/repos/${codecommit_repo_name} --all

# Push all the repository tags to CodeCommit
git push ssh://git-codecommit.${aws_region}.amazonaws.com/v1/repos/${codecommit_repo_name} --tags

# Cleanup - Remove all the local files and directories
rm -rf ${migration_dir}