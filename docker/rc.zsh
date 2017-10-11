# Docker aliases
alias dps="docker ps"
alias dr="docker run -it"
alias drd="docker run -dit"
alias db="docker build"
alias ds="docker stop"
alias dt="docker tag"
alias dsall="docker ps | grep -v '^CONTAINER' | cut -d ' ' -f 1 | xargs docker stop"
alias dp="docker push"
alias drm="docker rm"
function drmi() {
  docker rmi `docker images --filter 'dangling=true' -q --no-trunc`
}
function drmall() {
  docker rm `docker ps -aq --no-trunc --filter "status=exited"`
}
alias dc="docker-compose"
