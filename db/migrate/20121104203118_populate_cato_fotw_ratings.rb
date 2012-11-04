class PopulateCatoFotwRatings < ActiveRecord::Migration
  def up
    Rating.delete_all
    user = User.find_by_username('Empact')
    org = Organization.find_or_create_by_name('The Cato Institute',
      short_name: 'Cato',
      slogan: 'Individual Liberty, Free Markets, and Peace',
      url: 'http://www.cato.org/',
      created_by: user
    )
    report = org.reports.find_or_create_by_name('Economic Freedom of the World',
      url: 'http://www.cato.org/pubs/efw/',
      description: <<-DESCRIPTION,
The foundations of economic freedom are personal choice, voluntary exchange, and open markets. As Adam Smith, Milton Friedman, and Friedrich Hayek have stressed, freedom of exchange and market coordination provide the fuel for economic progress. Without exchange and entrepreneurial activity coordinated through markets, modern living standards would be impossible.

Potentially advantageous exchanges do not always occur. Their realization is dependent on the presence of sound money, rule of law, and security of property rights, among other factors. Economic Freedom of the World seeks to measure the consistency of the institutions and policies of various countries with voluntary exchange and the other dimensions of economic freedom. The report is copublished by the Cato Institute, the Fraser Institute in Canada and more than 70 think tanks around the world.
DESCRIPTION
      created_by: user
    )
    pub = report.publications.find_or_create_by_name('Economic Freedom of the World: 2012 Annual Report',
      summary: <<-SUMMARY,
Global economic freedom bounced back slightly in this year's report. After falling for two consecutive years following a long trend of increases, the average score rose from 6.79 in 2009 to 6.83 in 2010, the most recent year for which data is available. In this year's index, Hong Kong retains the highest rating for economic freedom, 8.90 out of 10 (down slightly from 9.01 last year). The rest of this year's top scores are Singapore, 8.69; New Zealand, 8.36; Switzerland, 8.24; Australia, 7.97; Canada, 7.97; Bahrain, 7.94; Mauritius, 7.90. Finland, 7.88; and Chile, 7.84. Bahrain and Finland are new to the top 10 — replacing, notably, the United Kingdom (fell to 12th) and the United States (a sizable drop to 18th).

The United States, long considered the standard bearer for economic freedom among large industrial nations, has experienced a substantial decline in economic freedom during the past decade. From 1980 to 2000, the United States was generally rated the third freest economy in the world, ranking behind only Hong Kong and Singapore. After increasing steadily during the period from 1980 to 2000, the chain linked EFW rating of the United States fell from 8.65 in 2000 to 8.21 in 2005 and 7.70 in 2010. The chain-linked ranking of the United States has fallen precipitously from second in 2000 to eighth in 2005 and 19th in 2010 (unadjusted ranking of 18th).

The rankings (and scores) of other large economies in this year's index are Japan, 20th (7.64); Germany, 31st (7.52); France, 47th (7.32); Italy, 83rd (6.77); Mexico, 91st, (6.66); Russia, 95th (6.56); Brazil, 105th (6.37); China, 107th (6.35); and India, 111th (6.26).

Nations in the top quartile of economic freedom had an average per-capita GDP of $37,691 in 2010, compared to $5,188 for bottom quartile nations in 2010 current international dollars. In the top quartile, the average income of the poorest 10% was $11,382, compared to $1,209 in the bottom in 2010 current international dollars. Interestingly, the average income of the poorest 10% in the most economically free nations is more than twice the overall average income in the least free nations. Life expectancy is 79.5 years in the top quartile compared to 61.6 years in the bottom quartile, and political and civil liberties are considerably higher in economically free nations than in unfree nations.

The first Economic Freedom of the World Report, published in 1996, was the result of a decade of research by a team which included several Nobel Laureates and over 60 other leading scholars in a broad range of fields, from economics to political science, and from law to philosophy. This is the 16th edition of Economic Freedom of the World and this year's publication ranks 144 nations for 2010, the most recent year for which data are available.
SUMMARY
      authors: <<-AUTHORS,
By James Gwartney, Robert Lawson, and Joshua Hall, and contributions from Scott L. Baier, Christian Bjørnskov, Matthew Clance, Alice M. Crisp, Axel Dreher, Gerald P. Dwyer, Nicolai J. Foss, and Kai Gehring.
AUTHORS
      created_by: user
    )
    [
      [89.0, 'Hong Kong',  1],
      [86.9, 'Singapore',  2],
      [83.6, 'New Zealand',  3],
      [82.4, 'Switzerland',  4],
      [79.7, 'Australia',  5],
      [79.7, 'Canada',  5],
      [79.4, 'Bahrain',  7],
      [79.0, 'Mauritius',  8],
      [78.8, 'Finland',  9],
      [78.4, 'Chile',  10],
      [78.3, 'United Arab Emirates',  11],
      [77.5, 'Ireland',  12],
      [77.5, 'United Kingdom',  12],
      [77.4, 'Estonia',  14],
      [77.2, 'Taiwan', 15],
      [77.1, 'Denmark',  16],
      [77.0, 'Qatar',  17],
      [76.9, 'United States',  18],
      [76.6, 'Kuwait',  19],
      [76.4, 'Cyprus',  20],
      [76.4, 'Japan',  20],
      [76.4, 'Oman',  20],
      [76.3, 'Jordan',  23],
      [76.1, 'Peru',  24],
      [75.7, 'Malta',  25],
      [75.7, 'Norway',  25],
      [75.6, 'Austria',  27],
      [75.4, 'Lithuania',  28],
      [75.4, 'Montenegro',  28],
      [75.3, 'Sweden',  30],
      [75.2, 'Germany',  31],
      [74.7, 'Luxembourg',  32],
      [74.5, 'Slovak Republic',  33],
      [74.3, 'Spain',  34],
      [74.2, 'Armenia',  35],
      [74.1, 'Romania',  36],
      [74.0, 'Korea, South',  37],
      [74.0, 'Netherlands',  37],
      [74.0, 'Panama',  37],
      [73.6, 'Bahamas',  40],
      [73.5, 'Belgium',  41],
      [73.4, 'Albania',  42],
      [73.4, 'Costa Rica',  42],
      [73.4, 'Georgia',  42],
      [73.3, 'Bulgaria',  45],
      [73.3, 'Rwanda',  45],
      [73.2, 'France',  47],
      [73.1, 'Poland',  48],
      [73.1, 'Zambia',  48],
      [73.0, 'Uganda', 50],
      [72.9, 'Uruguay',  51],
      [72.4, 'Honduras',  52],
      [72.4, 'Israel',  52],
      [72.4, 'Nicaragua',  52],
      [72.1, 'Guatemala',  55],
      [72.0, 'El Salvador',  56],
      [72.0, 'Fiji',  56],
      [71.6, 'Cambodia',  58],
      [71.6, 'Czech Republic',  58],
      [71.4, 'Portugal',  60],
      [71.2, 'Latvia',  61],
      [71.2, 'Philippines',  61],
      [70.9, 'Dominican Republic',  63],
      [70.8, 'Hungary',  64],
      [70.6, 'Iceland',  65],
      [70.6, 'Saudi Arabia',  65],
      [70.3, 'Botswana',  67],
      [70.3, 'Papua New Guinea',  67],
      [70.1, 'Mongolia',  69],
      [69.7, 'Kazakhstan',  70],
      [69.6, 'Ghana',  71],
      [69.6, 'Malaysia', 71],
      [69.4, 'Barbados',  73],
      [69.4, 'Macedonia',  73],
      [69.2, 'Turkey',  75],
      [68.8, 'Indonesia',  76],
      [68.8, 'Trinidad & Tobago',  76],
      [68.7, 'Kenya',  78],
      [68.4, 'Jamaica',  79],
      [68.1, 'Tunisia',  80],
      [67.8, 'Greece',  81],
      [67.8, 'Paraguay',  81],
      [67.7, 'Italy',  83],
      [67.6, 'Croatia',  84],
      [67.5, 'Moldova', 85],
      [67.5, 'South Africa',  85],
      [67.0, 'Thailand',  87],
      [66.8, 'Belize',  88],
      [66.8, 'Kyrgyz Republic',  88],
      [66.8, 'Malawi',  88],
      [66.6, 'Mexico',  91],
      [66.3, 'Slovenia',  92],
      [66.1, 'Bosnia & Herzegovina',  93],
      [65.9, 'Namibia',  94],
      [65.6, 'Russia',  95],
      [65.4, 'Vietnam',  96],
      [65.0, 'Colombia',  97],
      [65.0, 'Haiti',  97],
      [64.9, 'Egypt',  99],
      [64.8, 'Sri Lanka',  100],
      [64.2, 'Madagascar',  101],
      [64.1, 'Morocco',  102],
      [64.1, 'Serbia',    102],
      [63.9, 'Bolivia',  104],
      [63.7, 'Brazil',  105],
      [63.6, 'Cameroon',  106],
      [63.5, 'China',  107],
      [63.5, 'Tanzania',  107],
      [63.4, 'Bangladesh',  109],
      [63.3, 'Nepal',  110],
      [62.6, 'India',  111],
      [62.6, 'Iran',  111],
      [62.6, 'Pakistan',  111],
      [62.4, 'Guyana',  114],
      [61.8, 'Benin',  115],
      [61.7, 'Azerbaijan',  116],
      [61.2, 'Mali',  117],
      [60.9, 'Burkina Faso',  118],
      [60.8, 'Syria',  119],
      [60.7, 'Nigeria',  120],
      [59.9, 'Sierra Leone',  121],
      [59.4, 'Ukraine',  122],
      [58.8, 'Gabon',  123],
      [58.8, 'Senegal',  123],
      [58.1, 'Lesotho',  125],
      [58.0, 'Ecuador',  126],
      [57.9, 'Argentina',  127],
      [57.8, 'Niger',  128],
      [57.6, 'Côte d’Ivoire',  129],
      [57.3, 'Central African Rep.',  130],
      [57.2, 'Ethiopia',  131],
      [56.7, 'Mauritania',  132],
      [55.9, 'Togo',  133],
      [54.5, 'Burundi',  134],
      [54.5, 'Mozambique',  134],
      [54.1, 'Chad',  136],
      [53.4, 'Algeria',  137],
      [52.3, 'Guinea-Bissau',   138],
      [51.8, 'Congo, Dem. Rep. of',  139],
      [51.2, 'Angola',  140],
      [48.6, 'Congo, Republic of',  141],
      [43.5, 'Zimbabwe',  142],
      [42.9, 'Myanmar',  143],
      [40.7, 'Venezuela',  144]
    ].each do |score, nation_name, rank|
      pub.ratings.create!(
        score: score,
        nation_name: nation_name,
        rank: rank
      )
    end
  end

  def down
  end
end
