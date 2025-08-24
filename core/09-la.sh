# This is free and unencumbered software released into the public domain.

# Alias 'la' to 'ls -la'

mkdir /usr/etc/profile.d

cat > /usr/etc/profile.d/la.sh <<EOF
alias la="ls -la"
EOF
