function Image(img)
    if img.classes:find('mylua',1) then
      local f = io.open("myfile/" .. img.src, 'r')
      local doc = pandoc.read(f:read('*a'))
      f:close()
      local caption = pandoc.utils.stringify(doc.meta.caption)
      local name = pandoc.utils.stringify(doc.meta.name)
      local am = pandoc.utils.stringify(doc.meta.id)

      local line = "_____________________________________________________________"
      local mylua = line .. "\n\n"
      mylua = mylua .. "> _" .. caption .. "_ \n>"
      mylua = mylua .. "\n\n" .. line .. "\n\n"
      mylua = mylua .. "> _"  .. name .. " " .. am .. "_ \n>"
      mylua = mylua .. "\n\n" .. line .. "\n\n"

      return pandoc.RawInline('markdown', mylua)
    end
end
