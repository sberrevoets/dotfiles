import lldb
import os

kNoResult = 0x1001

@lldb.command("load_swift")
def load_swift(debugger, path, ctx, result, _):
    with open(os.path.expanduser(path)) as f:
        contents = f.read()
    if path.endswith(".swift"):
        options = lldb.SBExpressionOptions()
        options.SetLanguage(lldb.eLanguageTypeSwift)
        error = ctx.frame.EvaluateExpression(contents, options).error
    else:
        error = ctx.frame.EvaluateExpression(contents).error
    if error.fail and error.value != kNoResult:
        result.SetError(error)
