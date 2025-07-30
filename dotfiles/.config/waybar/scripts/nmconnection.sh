
status=$(nmcli networking connectivity)

result=""
case $status in
	"full")
		result="*"
		;;
	"limited")
		result="-"
		;;
	"none")
		result="X"
		;;
	*)
		result="?"
		;;
esac
echo "$result"
