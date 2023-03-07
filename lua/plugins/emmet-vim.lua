vim.g.user_emmet_settings = {
    svelte = {
        extends = 'html',
    },
}
-- Add meta tag for responsiveness to html:5 emmet snippet
vim.g.user_emmet_settings = {
    variables = { lang = 'en' },
    html = {
        default_attributes = {
            option = { value = nil },
            textarea = { id = nil, name = nil, cols = 10, rows = 10 },
        },
        snippets = {
            ["html:5"] = "<!DOCTYPE html>\n" ..
            "<html lang=\"${lang}\">\n" ..
            "<head>\n" ..
            "\t<meta charset=\"${charset}\">\n" ..
            "\t<title></title>\n" ..
            "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" ..
            "</head>\n" ..
            "<body>\n" ..
            "\t${child}|\n" ..
            "</body>\n" ..
            "</html>",
        },
    },
}
