# ❯ $SHELL --version
# GNU bash, 버전 5.1.16(1)-release (x86_64-apple-darwin20.6.0)
# Copyright (C) 2020 Free Software Foundation, Inc.
# 라이선스 GPLv3+: GNU GPL version 3 or later <http://gnu.org/license/gpl.html>

# This is free software; you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

for file in ~/.bash_profile.d/*
do
  source "${file}"
done
