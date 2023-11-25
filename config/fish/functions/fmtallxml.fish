function fmtallxml
    for f in *.xml
        xmllint "$f" --format | sponge "$f"
    end
end
