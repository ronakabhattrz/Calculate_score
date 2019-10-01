def ronak
  require 'net/http'
  require 'json'
  result = Net::HTTP.get(URI.parse('https://api.github.com/users/dhh/events/public'))
  r = JSON.parse result
  issuesevent = []
  issuecommentevent = []
  pushevent = []
  pullrequestreviewcommentevent = []
  watchevent = []
  createevent = []
  otherevent = []
  r.each do |ele|
    if ele["type"] == "IssuesEvent"
      issuesevent.push("IssuesEvent")
    elsif ele["type"] == "PushEvent"
      pushevent.push("PushEvent")
    elsif ele["type"] == "IssueCommentEvent"
      issuecommentevent.push("IssueCommentEvent")
    elsif ele["type"] == "PushEvent"
      pushevent.push("PushEvent")
    elsif ele["type"] == "PullRequestReviewCommentEvent"
      pullrequestreviewcommentevent.push("PullRequestReviewCommentEvent")
    elsif ele["type"] == "WatchEvent"
      watchevent.push("WatchEvent")
    elsif ele["type"] == "CreateEvent"
      createevent.push("CreateEvent")
    else
      otherevent.push("other")
    end
  end
  score = issuesevent.length + issuecommentevent.length + pushevent.length + pullrequestreviewcommentevent.length + watchevent.length + createevent.length + otherevent.length
  puts "DHH's github score is #{score}"
end
ronak