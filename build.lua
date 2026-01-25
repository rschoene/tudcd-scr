#!/usr/bin/env texlua

--[[
  Build script for the tudcd-scr project
  Copyright (C) 2025–2026 Jochen Diepelt

  This file is part of the build system of the tudcd-scr bundle.

  It may be distributed and/or modified under the conditions of the
  LaTeX Project Public License (LPPL), either version 1.3c of this
  license or (at your option) any later version. The latest version
  of this license is in the file

  https://www.latex-project.org/lppl.txt
]]


-- Identifizierung
module = "tudcd"
pkgversion = "0.5.4"
pkgdate    = "2026-01-25"

-- Dateipfade
sourcefiledir = "source"
docfiledir = "doc"
supportdir = "support"
--[[
  Die Examples müssen in diesem Verzeichnis sein.
]]
demofiledir = "examples"
testfiledir = "tests"
-- Ich habe Literaturverweise, diese müssen mit in das Verzeichnis für die Dokumentation kopiert werden.
typesetsuppfiles = { "*.bib" }
-- Dies sind Dateien welche vor der eigentlichen Dokumentation gesetzt werden müssen.
typesetdemofiles = {  }
-- Diese beiden Dateien ergeben die Dokumentation.
typesetfiles = { "tudcd-doc.dtx", "handbook.tex" }
-- Automatisches Updaten der Version und Datum
tagfiles = { "tudcd-common.dtx" }
local mydate = os.date("!%Y-%m-%d")

function update_tag(file, content, tagname, tagdate)
  if not tagname and tagdate == mydate then
    tagname = pkgversion
    tagdate = pkgdate
    print("** "..file.." have been tagged with the version and date of build.lua")
  else
    local v_maj, v_min, patch = string.match(tagname, "^v?(%d+)%.(%d+)%.(%d+)$")
    if v_maj == "" or not v_min or not patch then
      print("Error!!: Invalid tag '"..tagname.."', none of the files have been tagged")
      os.exit(0)
    else
      tagname = string.format("%i.%i.%i", v_maj, v_min, patch)
      tagdate = mydate
    end
    print("** "..file.." have been tagged with the version "..tagname.." and date "..mydate)
  end

  if string.match(file, "%.dtx$") then
    local tagdate = string.gsub(tagdate, "-", "/")
    content = string.gsub(content,
                          "\\newcommand\\tudcd@common@version{%d+%p%d+%p%d+}",
                          "\\newcommand\\tudcd@common@version{"..tagname.."}")
    content = string.gsub(content,
                          "\\newcommand\\tudcd@common@date{%d%d%d%d/%d%d/%d%d}",
                          "\\newcommand\\tudcd@common@date{"..tagdate.."}")
  end

--[[
  if string.match(file, "CTANREADME.md") then
    local tagdate = string.gsub(tagdate, "/", "-")
    content = string.gsub(content,
                          "Version: (%d+)(%S+)",
                          "Version: "..tagname)
    content = string.gsub(content,
                          "Date: %d%d%d%d%-%d%d%-%d%d",
                          "Date: "..tagdate)
  end
]]
  return content
end