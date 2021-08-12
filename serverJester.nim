import times
# import prologue
# import prologue/middlewares/staticfile
import jester

import nimja
import os, strutils
import shared

proc renderIndex(): string =
  let datasets = load()
  compileTemplateFile(getScriptDir() / "index.nwt")

# proc renderError(code: HttpCode): string =
#   compileTemplateStr("{%extends partials/_master.nwt%}{%block title%}{{code}}{%endblock%}{%block content%}{%endblock%}")

routes:
  get "/":
    resp renderIndex()
