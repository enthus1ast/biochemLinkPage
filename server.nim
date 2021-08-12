import prologue
import prologue/middlewares/staticfile

import nimja
import os, strutils
import shared

proc renderIndex(): string =
  let datasets = load()
  compileTemplateFile(getScriptDir() / "index.nwt")

proc renderError(code: HttpCode): string =
  compileTemplateStr("{%extends partials/_master.nwt%}{%block title%}{{code}}{%endblock%}{%block content%}{%endblock%}")

proc index*(ctx: Context) {.async.} =
  resp renderIndex()

proc go404*(ctx: Context) {.async.} =
  resp renderError(code = Http404), Http404

var app = newApp()
app.get("/", index)
app.use(staticFileMiddleware("assets"))
app.registerErrorHandler(Http404, go404)
app.run()