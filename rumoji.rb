require "rumoji/emoji"

def render(data, modifier, modifier_data, message)
  message.gsub(/(:[\w-]+:)/) do |full|
    sym = Rumoji::Emoji.find(full[1..-2].intern)
    sym ? sym.to_s : full
  end
end

def weechat_init
  Weechat.register 'rumoji', 'Pedro Ferreira', '0.0.1', 'MIT',
    'Render emoji using Rumoji', '', ''

  Weechat.hook_modifier("weechat_print", "render", "")

  Weechat::WEECHAT_RC_OK
end
