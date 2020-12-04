### System Preferences > Keyboard

#### Keyboard

# Key Repeat (faster than fastest UI option)
defaults write NSGlobalDomain KeyRepeat -int 1

# Delay Until Repeat (shorter than shortest UI option)
defaults write NSGlobalDomain InitialKeyRepeat -int 10

#### Text

# [x] Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true

# [ ] Capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# [x] Add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true

# [ ] Touch Bar typing suggestions
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Spelling: Automatic by Language
defaults write NSGlobalDomain NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true
