set -u

_TOKEN=$(date '+%s%N' | md5sum)
_LAB_URL="http://localhost:8888?token=${_TOKEN}"
echo ${_LAB_URL}
xdg-open "${_LAB_URL}"

docker run --rm \
    -p 8888:8888 \
    -e JUPYTER_ENABLE_LAB=yes \
    -v "$PWD":/home/jovyan/work jupyter/datascience-notebook \
    jupyter lab \
        --LabApp.token="$_TOKEN"

set +u
