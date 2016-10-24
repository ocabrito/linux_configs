import sys,re

argv_list = sys.argv

def validArgs(validate_list):
  """Parse arguments this script can hadle, raise exception othewise."""
  for i in range(1, len(validate_list)) :
    arg = validate_list[i]
    print "Argument was: "+arg
    match = re.match(r'(\b--subnet |\b-d ) ',arg)
    if match:
      print match.string

validArgs(argv_list)


"""
args=($@)

valid_args=("--subnet -d --driver --gateway")

function test_args

# network setup

docker network create --subnet 172.22.0.0/24 -d overlay test_net

# service setup
docker service create --network test_net --name test -p 9200 -p 9300 my_e
# scaling setup
"""

