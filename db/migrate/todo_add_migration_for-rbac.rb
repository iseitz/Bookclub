# create_table "rbac", force: :cascade do |t|
#   t.string "access_name" # member, admin, etc
#   t.string "permissions" # read_book, add_review, remove_review
# end
#
# access_name = member
# permissions = "read_book,add_review,remove_review,upvote,downvote"
# access_name = admin
# permissions = "read_book,add_review,remove_review,upvote,downvote,add_book,remove_user,add_user,edit_review"
