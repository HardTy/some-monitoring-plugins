#!/bin/bash
PAMPASSWORDAUTH='/etc/pam.d/password-auth'
RETURN=$(grep -q "pam_tally2.so" ${PAMPASSWORDAUTH}; echo $?)

if [[ ${RETURN} -eq 0 ]]; then
	echo "OK: pam_tally2.so is configured in ${PAMPASSWORDAUTH}"
	exit 0
else
	echo "CRITICAL: pam_tally2.so not found in ${PAMPASSWORDAUTH}. Please check the authentication configuration on this system!"
	exit 1
fi
