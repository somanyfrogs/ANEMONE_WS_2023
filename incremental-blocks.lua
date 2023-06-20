-- 'incremental-blocks.lua'

function Div(div)
    -- Evaluate whether 'Div' has incremental-blocks
    local incremental = false
    for _, class in ipairs(div.classes) do
        incremental = incremental or (class == 'incremental-blocks')
    end

    if incremental then
        for i, content in ipairs(div.content) do
            div.content[i] = pandoc.Div(content)
            div.content[i].classes = {'fragment'}
        end
    end

    -- return new div
    return(div)
end

