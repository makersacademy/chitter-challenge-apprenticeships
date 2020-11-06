# Prepare and execute. Returns array that has id, title, url. result[0] = Bookmark. result[0]['title'] = "Jeeves"
    prepared_string = "insert into bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;"
    result = DatabaseQuery.query(prepared_string)