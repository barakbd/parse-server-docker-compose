#List tags
# Remote
Git ls-remote —tags
# Local
Git tag
# https://git-scm.com/docs/git-ls-remote.html

# Delete remote tag
git push origin :tagname
git push --delete origin tagname
# https://stackoverflow.com/questions/5480258/how-to-delete-a-git-remote-tag

# Delete local tag
git tag --delete tagname

# Find commit for tag
git rev-list -n 1 tag name
# https://stackoverflow.com/questions/1862423/how-to-tell-which-commit-a-tag-points-to-in-git

# Bitbucket
# Create an annotated tag	
git tag -a <tag_name> -m '<tag_message>'
# Create a lightweight tag	
git tag <tag_name>
# Push all your tags (a regular push won't push a tag)	
git push origin --tags
# Push a single tag	
git push origin : <tag_name>
# List the tags in a repository	
git tag
# Remove a tag from a repository	
git tag -d <tag_name>
git push origin :refs/tags/<tag_name>
# https://confluence.atlassian.com/bitbucket/use-repository-tags-321860179.html

# Jenkins update Tag
docker pull containers.cisco.com/cdt-org/box:dev

docker images -q --no-trunc --filter "label=git_commit=705e0cafea546c0000398944269a1ab80aae0e3b"
docker images -q --no-trunc --filter label=git_commit=$git_commit

if [[ $(docker images -q --no-trunc --filter label=git_commit=$git_commit) ]]; then 
	echo “docker image found by git_commit“;
else 
	echo “image not found locally“;
	docker pull containers.cisco.com/cdt-org/box:dev
fi
image_id=$(docker images -q --no-trunc --filter label=git_commit=$git_commit)
Docker tag $image_id containers.cisco.com/cdt-org/box:stage
Docker push containers.cisco.com/cdt-org/box:stage
# https://stackoverflow.com/questions/12137431/test-if-a-command-outputs-an-empty-string

echo test Jenkins bugfix 2
