exec ssh-agent $BASH -s 10<&0 << EOF
    ssh-add ~/.ssh/id_rsa &> /dev/null
    exec $BASH <&10-
EOF
