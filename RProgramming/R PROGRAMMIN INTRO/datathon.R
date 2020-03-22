

datathon <- read.csv(file.choose())

datathon2 <- read.csv(file.choose())

ggplot(data = datathon, aes(x = Bounce_Rate, y = Pages_Session, colour =Pageviews)) + geom_point()

colnames(datathon)

meteor <- read.csv(file.choose())
ozelgun <- read.csv(file.choose())
magaza <- read.csv(file.choose())
klasman <- read.csv(file.choose())
tarih <- read.csv(file.choose())
satiskesf <- read.csv(file.choose())

