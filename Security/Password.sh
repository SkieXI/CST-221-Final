echo "Please enter a password for evaluation: "
echo
echo "Password criteria: Must contain at least 8 characters."
echo "One numeric value."
echo "One uppercase character."
echo "One special character. ex: !@#$"
echo "==="

read password
echo

if [[ ${#password} -ge 8 ]]
then
	echo "Length: Passed."
else
	echo "Password does not contain 8 characters"
fi
if [[ "$password" =~ [A-Z] ]]
then
	echo "Capitalization: Passed."
else
	echo "Password does not contain a upper case character."
fi
if [[ "${password//[^@#$%&*!;:+=-]/}" ]]
then
	echo "Special Character: Passed."
else
	echo "Password does not contain a special character."
fi
if [[ "$password" == *[0-9]* ]] 
then
	echo "Numeric value: Passed."
else
	echo "Password does not contain a numeric value."
fi
if [[ "$password" == 'password' ]]
then
	echo
	echo "Yeah, good luck with that!"
fi