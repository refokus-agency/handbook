#Guide for Issue Tagging

_NOTE: We use [github-label-manager] to import the labels from another repository. Be sure to import them after creating a new one_

Based in [this article](https://robinpowered.com/blog/best-practice-system-for-organizing-and-tagging-github-issues/), we use organize the tags in this way:

Problems              [photo][photo][photo]
Experience            [photo]
Environment           [photo]
Feedback              [photo][photo][photo]
Improvements          [photo][photo]
Additions             [photo][photo]
Pending               [photo][photo]
Inactive              [photo][photo][photo]
Inactive (for time)   [photo]

##Label Groups
TODO rewrite label groups

#### Problems
Issues that make the product feel broken. High priority, especially if its present in production.

#### Experience
Affect user’s comprehension, or overall enjoyment of the product. These can be both opportunities and “UX bugs”.

#### Environment
Server environment. With good QA, you’ll identify issues on test and staging deployments.

#### Feedback
Requires further conversation to figure out the action steps. Most feature ideas start here.

#### Improvements
Iterations on existing features or infrastructure. Generally these update speed, or improve the quality of results. Adding a new “Owner” field to an existing “Calendar” model in the API, for example.

#### Additions
Brand new functionality. New pages, workflows, endpoints, etc.

#### Pending
Taking action, but need a few things to happen first. A feature that needs dependencies merged, or a bug that needs further data.

#### Inactive
No action needed or possible. The issue is either fixed, addressed better by other issues, or just out of product scope.

#### Inactive for time
No action needed or possible. The issue is either fixed, addressed better by other issues, or just out of product scope.
