my_ip1=$(ip addr | grep 'state UP' -A2 | tail -n1 |awk '{print $2}')
my_ip=${my_ip1%/24}
echo "My ip address is ${my_ip}"

echo "Enter the termux user: "
read termux_user
echo "Termux user is ${termux_user}!"
echo "-----------------------------"

echo "Enter the termux ip address : "
read termux_ip
echo "Termux ip address is ${termux_ip}"
echo "sshuttle -r ${termux_user}@${termux_ip}:8022 0/0 -x ${my_ip}/24"


sshuttle -r ${termux_user}@${termux_ip}:8022 0/0 -x ${my_ip}/24
