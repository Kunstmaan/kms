if [[ ! -o interactive ]]; then
    return
fi

compctl -K _kms kms

_kms() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(kms commands)"
  else
    completions="$(kms completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
