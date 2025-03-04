#!/usr/bin/env zsh
# -*- mode: sh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
#
# Original work Copyright (c) 2019-2020 Sebastian Gniazdowski
# Modified work Copyright (c) 2020-2021 Nicholas Serrano
# Modified work Copyright (c) 2022 zdharma-continuum and contributors

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

[[ -d $ZPFX/bin ]] || command mkdir -p "$ZPFX/bin"

autoload :za-lb-atclone-handler :za-lb-atdelete-handler

# An empty stub to fill the help handler fields
:za-lb-null-handler() { :; }

@zinit-register-annex "z-a-linkbin" \
  hook:atclone-50 \
  :za-lb-atclone-handler \
  :za-lb-null-handler \
  "lbin|lbin''" # also register new ices

@zinit-register-annex "z-a-linkbin" \
  hook:\%atpull-50 \
  :za-lb-atclone-handler \
  :za-lb-null-handler

@zinit-register-annex "z-a-linkbin" \
  hook:atdelete-50 \
  :za-lb-atdelete-handler \
  :za-lb-null-handler

