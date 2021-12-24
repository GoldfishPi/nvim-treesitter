local Runner = require("tests.indent.common").Runner
local XFAIL = require("tests.indent.common").XFAIL

local run = Runner:new(it, "tests/indent/typescriptreact", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 0,
  expandtab = true,
});

describe("new line", function ()
  run:new_line('basic.tsx', { on_line = 4, text = "", indent = 4  })
  run:new_line('basic.tsx', { on_line = 4, text = "<div />", indent = 4  })
  run:new_line('basic.tsx', { on_line = 5, text = "<div />", indent = 6  })
  run:new_line('basic.tsx', { on_line = 5, text = "{v}", indent = 6  })

  -- map components
  run:new_line('map.tsx', { on_line = 5, text = "<div key={item} />", indent = 8  })

  -- fragments
  -- this should fail, not sure why it's not..
  run:new_line('fragment.tsx', { on_line = 6, text = "</>", indent = 8  })
end)
