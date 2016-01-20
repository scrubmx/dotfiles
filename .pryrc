# EDITOR
Pry.editor = 'vim'
Pry.config.color = true
Pry.config.theme = "tomorrow-night"

# Wrap ANSI codes so Readline knows where the prompt ends
def format_color(name, text)
  if Pry.color
    "\001#{Pry::Helpers::Text.send name, '{text}'}\002".sub '{text}', "\002#{text}\001"
  else
    text
  end
end

# CUSTOM PROMPT
prompt_format = proc do |object, nest_level, pry|
  prompt  = format_color :bright_black, Pry.view_clip(object)
  prompt += ":#{nest_level}" if nest_level > 0
  prompt += format_color :cyan, ' » '
end

Pry.prompt = [prompt_format, prompt_format]
