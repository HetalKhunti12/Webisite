json.extract! listing, :id, :objectTitle, :objectLocation1, :objectLocation2, :objectCountry, :objectPrimaryCategoryID, :objectRootCategoryId, :objectDescription1, :objectDescription2, :objectKeywords, :objectPricing, :objectEnabled, :dateLevelExpires, :objectTypeID, :objectStatus, :objectApproved, :objectApproved, :cotact_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)