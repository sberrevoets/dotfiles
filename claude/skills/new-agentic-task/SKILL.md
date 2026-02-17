---
name: new-agentic-task
description: This skill should be used when the user asks to "create an agentic task", "set up a new agent task", "scaffold an agentic workflow", or generally starts a large body of changes. 
version: 1.0.0
---

# New Agentic Task

* Use the `agents` CLI to start a new task:
    * Use `agents new [task name]` - come up with a good task name based on the
      changes requested
    * `agents list` provides a complete list of all other tasks run by agents
* If the `agents` CLI isn't available, have the user resolve that first

## When This Skill Applies

This skill activates when the user's request involves:
* Starting a larger body of work
* The work is small but there are uncommitted changes in the repo
