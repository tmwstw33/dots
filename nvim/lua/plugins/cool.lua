local lush = require('lush')
local hsl = lush.hsl

-- Пример минимальной цветовой схемы
return lush(function()
  return {
    Normal { bg = hsl("#1a1b26"), fg = hsl("#c0caf5") },
    Comment { fg = hsl("#565f89"), gui = "italic" },
    Visual { bg = hsl("#33467c") },
    String { fg = hsl("#9ece6a") },
    Number { fg = hsl("#ff9e64") },
    Function { fg = hsl("#7aa2f7") },
    TypeDef { fg = hsl("#2ac3de") },
    Special { fg = hsl("#bb9af7") },
  }
end)
