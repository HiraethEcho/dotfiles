Header:children_add(function()
  if ya.target_family() ~= "unix" then
    return ui.Line({})
  end
  return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)

Status:children_add(function()
  local h = cx.active.current.hovered
  if h == nil or ya.target_family() ~= "unix" then
    return ""
  end

  return ui.Line({
    ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
    ":",
    ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
    " ",
  })
end, 500, Status.RIGHT)

require("git"):setup({
  show_branch = true,
})

-- require("githead"):setup()

require("session"):setup({
  sync_yanked = true,
})

require("eza-preview"):setup({ level = 2, follow_symlinks = true, dereference = false, all = true })
--[[ require("yatline"):setup({
  show_background = false,

  header_line = {
    left = {
      section_a = {
        { type = "line", custom = false, name = "tabs", params = { "left" } },
      },
      section_b = {
      },
      section_c = {
      }
    },
    right = {
      section_a = {
        { type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
      },
      section_b = {
        { type = "string", custom = false, name = "date", params = { "%X" } },
      },
      section_c = {
      }
    }
  },

  status_line = {
    left = {
      section_a = {
        { type = "string", custom = false, name = "tab_mode" },
      },
      section_b = {
        { type = "string", custom = false, name = "hovered_size" },
      },
      section_c = {
        { type = "string",   custom = false, name = "hovered_path" },
        { type = "coloreds", custom = false, name = "count" },
      }
    },
    right = {
      section_a = {
        { type = "string", custom = false, name = "cursor_position" },
      },
      section_b = {
        { type = "string", custom = false, name = "cursor_percentage" },
      },
      section_c = {
        { type = "string",   custom = false, name = "hovered_file_extension", params = { true } },
        { type = "coloreds", custom = false, name = "permissions" },
      }
    }
  },
}) ]]

require("mime-ext"):setup {
  -- Expand the existing filename database (lowercase), for example:
  with_files = {
    makefile = "text/makefile",
    -- ...
  },

  -- Expand the existing extension database (lowercase), for example:
  with_exts = {
    mk = "text/makefile",
    md = "text/plain",
    -- ...
  },

  -- If the mime-type is not in both filename and extension databases,
  -- then fallback to Yazi's preset `mime` plugin, which uses `file(1)`
  fallback_file1 = false,
}
