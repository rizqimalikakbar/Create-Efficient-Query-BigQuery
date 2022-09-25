SELECT 
  channelGrouping,
  ARRAY_AGG(STRUCT(geoNetwork_country, date, totals_transactions) ORDER BY geoNetwork_country, date)
FROM 
  (SELECT 
    channelGrouping, 
    SUM(totals_transactions) as totals_transactions, 
    date, 
    geoNetwork_country 
  FROM `data-to-insights.ecommerce.rev_transactions`
  GROUP BY channelGrouping, date, geoNetwork_country)
WHERE geoNetwork_country != '(not set)'
GROUP BY channelGrouping
ORDER BY channelGrouping;