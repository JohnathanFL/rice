function fmtalljson
    for f in *.json
        jq . "$f" | sponge "$f"
    end
end
