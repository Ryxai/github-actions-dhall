let Push =
      ../types/events/Push.dhall
        sha256:5147b1dd6eca94aae5d217b979cac20ba64b7ec160488dd917f171cae451b135

let PullRequest =
      ../types/events/PullRequest.dhall
        sha256:6b42c650c5a849dc6445287b85f6a55618f5e135be6cb8ef847a9c46d6c6672c

let PullRequestReview =
      ../types/events/PullRequestReview.dhall
        sha256:f7a1d37a7fa9ce33f736813d132503dcf9c46a3fc72c7327c07d799af9f6ea63

let Delete =
      ../types/events/Delete.dhall
        sha256:0912602a19e01dcff30f351958d2d9b69519c9be61b57b1b32a2a569bf8bf5f9

let Schedule =
      ../types/events/Schedule.dhall
        sha256:eb91edc996fadffb9cac1b67a4da220eed6bf54e96f7b8accbb613462e402537

let RepositoryDispatch =
      ../types/events/RepositoryDispatch.dhall
        sha256:f7a1d37a7fa9ce33f736813d132503dcf9c46a3fc72c7327c07d799af9f6ea63

let WorkflowCall =
      ../types/events/WorkflowCall.dhall
        sha256:08e5e74916cbdd4bb28988b144ecec79ece5d56336d84e458fc9e2985b0ba681

let WorkflowDispatch =
      ../types/events/WorkflowDispatch.dhall
        sha256:7c424307eed6fd275ccba117a66d3850b71ea6d41791d0544d1fad6f2ac5025a

let WorkflowRun =
      ../types/events/WorkflowRun.dhall
        sha256:63a3c3130a74d1af7e25a73b55ab719cda4a26ba0bfdee72214be7e43d23c46a

let Release =
      ../types/events/Release.dhall
        sha256:6dc17afaa0a74325dfd226bdc60d96e737978c8be500856b84d7075e869cad87

let MergeGroup =
      ../types/events/MergeGroup.dhall
        sha256:6932501dad0293756c78e48f64ae6b5549d373f7a178c26e300b69341de81fd6

let PullRequestTarget =
      ../types/events/PullRequestTarget.dhall
        sha256:20591763afd7bd762652e3bd5c856fc76b5f21c207e89bde486910e6ecada115

in  { push = None Push
    , pull_request = None PullRequest
    , pull_request_review = None PullRequestReview
    , pull_request_target = None PullRequestTarget
    , delete = None Delete
    , schedule = None (List Schedule)
    , repository_dispatch = None RepositoryDispatch
    , workflow_call = None WorkflowCall
    , workflow_dispatch = None WorkflowDispatch
    , workflow_run = None WorkflowRun
    , release = None Release
    , merge_group = None MergeGroup
    }
