# bash-trigger-gitlabpipeline

A simple Bash script to trigger Gitlab pipeline from the Api.  Usefull for CICD tools like Rundeck, Jenkins, etc...

#### Usage : 

    # ./trigger-gitlabpipeline.sh <gitlab_user_token> <gitlab_pipeline_token> <gitlab_pipeline_projetcs_id> 
    
<gitlab_pipeline_projetcs_id> : project id 

<gitlab_user_token> : Gitlab user token

<gitlab_pipeline_token> : Gitlab project pipeline token

###### Example : 

    # ./trigger-gitlabpipeline.sh 9948813 ft3z0tcgyJ999uoo2MsV 078a80343fe75711e5b020999e7583
