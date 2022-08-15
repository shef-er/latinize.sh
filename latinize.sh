#!/usr/bin/env bash

latinize_string() {
  TRS="${1}"
  TRS=$(echo "${TRS}" | sed "y/абвгдеёзийклмнопрстуфыэ/abvgdeezijklmnoprstufye/")
  TRS=$(echo "${TRS}" | sed "y/АБВГДЕЁЗИЙКЛМНОПРСТУФЫЭ/ABVGDEEZIJKLMNOPRSTUFYE/")
  TRS=${TRS//ц/ts}    TRS=${TRS//Ц/Ts}
  TRS=${TRS//х/kh}    TRS=${TRS//Х/Kh}
  TRS=${TRS//ж/zh}    TRS=${TRS//Ж/Zh}
  TRS=${TRS//ч/ch}    TRS=${TRS//Ч/Ch}
  TRS=${TRS//ш/sh}    TRS=${TRS//Ш/Sh}
  TRS=${TRS//щ/shch}  TRS=${TRS//Щ/Shch}
  TRS=${TRS//ю/iu}    TRS=${TRS//Ю/Iu}
  TRS=${TRS//я/ia}    TRS=${TRS//Я/Ia}
  TRS=${TRS//ъ/ie}    TRS=${TRS//Ъ/Ie}
  TRS=${TRS//ь/}      TRS=${TRS//Ь/}
  TRS=${TRS// /_}
  TRS=${TRS//\`}
  TRS=${TRS//\'}

  echo "${TRS}"
}


shopt -s nullglob

for NAME in * ; do

  TRS=$(latinize_string "${NAME}")

  if [[ "${NAME}" != "${TRS}" ]]; then
    mv -v "${NAME}" "${TRS}"
  fi

  if [[ -d "${TRS}" ]]; then
    cd "${TRS}" && "${0}"
  fi

done

shopt -u nullglob

