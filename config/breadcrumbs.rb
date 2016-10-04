crumb :root do
  link t('bbs.breadcrumbs.home'), main_app.root_path
end

crumb :category do |category|
  link category.name, bbs.category_topics_path(category)
end

crumb :comments do |topic|
  link topic.title, bbs.topic_comments_path(topic)

  parent :category, topic.category
end
