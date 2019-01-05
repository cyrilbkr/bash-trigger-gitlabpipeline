#!/bin/bash

projects=$1
tokenuser=$2
tokenpipeline=$3
datefile=`date '+%d%m%y%H%M%S'`
tmpfile="/tmp/gitlabtrigger_$projects_$datefile.tmp"

# check arg help
if [[ $# -eq 0 ]] ; then
    echo 'Usage : bin <gitlab_user_token> <gitlab_pipeline_token> <gitlab_pipeline_projetcs_id>'
    echo 'Example : bin 9948813 ft3z0tcgyJ999uoo2MsV 078a80343fe75711e5b020999e7583'
    exit 0
fi


echo "------------------------------------------------"
echo " Gitlab pipeline"
echo "------------------------------------------------"
echo ""

echo "Trigger Gitlab pipeline job for project $projects"
curl -X POST  -F token="$tokenpipeline"  -F ref=master -s  https://gitlab.com/api/v4/projects/$projects/trigger/pipeline | jq . > $tmpfile

id=`jq -r '.id' $tmpfile`
url=`jq -r '.web_url' $tmpfile`
echo "Gitlab job id : $id"
echo "Gitlab job url : $url"
echo ""

until [ $(curl --header "PRIVATE-TOKEN: $tokenuser"  -s https://gitlab.com/api/v4/projects/$projects/pipelines/$id | jq -r .status) = "success" ]; do
echo "pipeline is running, please wait  ..."
sleep 2
done

rm -f $tmpfile
echo ""
echo "Deployment complete"
echo "Success ! " 
