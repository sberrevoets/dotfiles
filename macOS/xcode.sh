# Trim trailing whitespace
defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true

# Trim whitespace-only lines
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true

# Show line numbers
defaults write com.apple.dt.Xcode DVTTextEditorShowLineNumbers -bool true

# Enable internal debug menu
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool true

# Open quickly opens in the focused pane
defaults write com.apple.dt.Xcode IDEEditorCoordinatorTarget_Click -string "FocusedEditor"

# Show build time in toolbar
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true

# Show build reasons in Xcode build log
defaults write com.apple.dt.Xcode ExplainWhyBuildCommandsAreRun -bool true

# Show remaining files to index
defaults write com.apple.dt.Xcode IDEIndexerActivityShowNumericProgress -bool true

# Disable "Print" shortcut. Oddly enough I never find myself wanting to print
# source code.
defaults write com.apple.dt.Xcode NSUserKeyEquivalents -dict-add "Print..." "nil"

# Not sure what this does; found using `defaults read com.apple.dt.Xcode`
defaults write com.apple.dt.Xcode DVTTextEnableTypeOverCompletions -bool true
defaults write com.apple.dt.Xcode IDESourceControlSuppressRevertSelectedDifference -bool true
defaults write com.apple.dt.Xcode IDEUserWantsToEnableDeveloperMode -bool true

# Use spaces, not tabs
defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool false

# Don't overscroll
defaults write com.apple.dt.Xcode DVTTextOverscrollAmount -bool false

# Swift style guide has 110 cols as the maximum
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 110

# The contextual menu isn't as useful as jumping to symbols
defaults write com.apple.dt.Xcode IDECommandClickNavigates -bool true

# Local derived data
defaults write com.apple.dt.Xcode IDECustomDerivedDataLocation -string "build.noindex"

# Source code integration in Xcode isn't really useful
defaults write com.apple.dt.Xcode IDEDisableGitSupportForNewProjects -bool true

# Wait for issues to come up until I build
defaults write com.apple.dt.Xcode IDEEnableLiveIssues -bool false

# Disable a number of warnings
defaults write com.apple.dt.Xcode IDESuppressInstructionPointerDraggingDialog -bool true
defaults write com.apple.dt.Xcode IDESuppressStopTestWarning -bool true
defaults write com.apple.dt.Xcode IDESuppressSelectNewScheme -bool true
defaults write com.apple.dt.Xcode IDESuppressStopBuildWarning -bool true
defaults write com.apple.dt.Xcode IDESuppressStopExecutionWarning -bool true
defaults write com.apple.dt.Xcode IDESourceControlSupressDiscardAllChangesConfirmation -bool true

# Set custom theme
defaults write com.apple.dt.Xcode XCFontAndColorCurrentDarkTheme -string "Monokai Inconsolata.xccolortheme"
defaults write com.apple.dt.Xcode XCFontAndColorCurrentTheme -string "Monokai Inconsolata.xccolortheme"
