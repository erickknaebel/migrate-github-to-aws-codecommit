# Migrate from Github to AWS CodeCommit
You can migrate any existing Git repository to a CodeCommit repository. This script below will help to migrate a project hosted on  Git repository to CodeCommit. 

Please be sure you have SSH access to AWS AND you have `AWSCodeCommitFullAccess` permissions available to you. For assistance with this, please visit [this repository](https://github.com/erickknaebel/aws-code-commit-setup).

_**Note:** This is for Linux/Mac/Windows users._

## Migration Details
First, from a shell/cmd window, create vaiables to store configuration variables.
_You can use the migrate.sh file in this repositiory but be sure to update the values to match your requirements_
```sh
migration_dir="./_trash"
git_url="https://github.com/erickknaebel/migrate-github-to-aws.codecommit.git"
aws_region="us-east-2"
codecommit_repo_name="some-repository-name"
```

## Create CodeCommit Repository
```sh
aws codecommit create-repository \
  --repository-name ${codecommit_repo_name} \
  --repository-description "My shiny new CodeCommit repository."
```

## Clone The Github Repository To Your Local Machine
```sh
git clone --mirror ${git_url} ${migration_dir}
```

## Push The Code To CodeCommit
```sh
cd ${migration_dir}
git push ssh://git-codecommit.${aws_region}.amazonaws.com/v1/repos/${codecommit_repo_name} --all
git push ssh://git-codecommit.${aws_region}.amazonaws.com/v1/repos/${codecommit_repo_name} --tags
```

## Remove All Temporary File From Local Machine
```sh
rm -rf ${migration_dir}
```

## Support
Please open a [GitHub issue](https://github.com/erickknaebel/migrate-github-to-aws-codecommit/issues/new).

## Feedback
Please open a [GitHub issue](https://github.com/erickknaebel/migrate-github-to-aws-codecommit/issues/new). I do encourage you to contribute your changes and send me pull request.

##### References
[1] - [AWS Docs - Migrate a Git Repository](https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-migrate-repository-existing.html)