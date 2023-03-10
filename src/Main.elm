module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { webApps : List WebApp
    }


type alias WebApp =
    { url : String
    , title : String
    , icon : String
    , description : String
    , price : String
    , category : String
    , platform : String
    }


init : Model
init =
    { webApps =
        [ { url = "https://figma.com/", title = "Figma", icon = "https://figma.com/favicon.ico", description = "A browser-based design and prototyping tool for creating UI designs, wireframes, and interactive prototypes.", price = "Free plan, paid plans start at $12/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.sketch.com/", title = "Sketch", icon = "https://www.sketch.com/favicon.ico", description = "A browser-based design tool for creating vector graphics, UI designs, and prototypes.", price = "Free trial, paid plans start at $9/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.invisionapp.com/studio", title = "InVision Studio", icon = "https://www.invisionapp.com/studio/static/favicon.ico", description = "A browser-based design and prototyping tool for creating interactive UI designs and prototypes.", price = "Free plan, paid plans start at $7.95/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://icons8.com/lunacy", title = "Icons8 Lunacy", icon = "https://icons8.com/lunacy/favicon.ico", description = "A browser-based graphic design tool for creating vector graphics, icons, and UI designs.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.xd.adobe.com/", title = "Adobe XD", icon = "https://www.adobe.com/favicon.ico", description = "A browser-based design and prototyping tool for creating interactive UI designs and prototypes.", price = "Free plan, paid plans start at $9.99/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.crello.com/", title = "Crello", icon = "https://www.crello.com/favicon.ico", description = "A browser-based design tool for creating graphics, animations, and social media posts.", price = "Free plan, paid plans start at $7.99/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.snappa.com/", title = "Snappa", icon = "https://www.snappa.com/favicon.ico", description = "A browser-based design tool for creating graphics, presentations, and social media posts.", price = "Free plan, paid plans start at $10/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.vectary.com/", title = "Vectary", icon = "https://www.vectary.com/favicon.ico", description = "A browser-based 3D design tool for creating and sharing 3D models.", price = "Free plan, paid plans start at $15/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.canva.com/", title = "Canva", icon = "https://www.canva.com/favicon.ico", description = "A browser-based graphic design tool that supports Windows, Linux, and Mac.", price = "Completely Free", category = "Graphic Design", platform = "Browser-Based" }
        , { url = "https://miro.com/", title = "Miro", icon = "https://miro.com/favicon.ico", description = "A collaborative online whiteboard platform that can be used for diagramming and mind mapping.", price = "Free trial, paid plans start at $8/month", category = "Diagramming", platform = "Browser-Based" }
        , { url = "https://www.adobe.com/express/create/design.html", title = "Adobe Spark", icon = "https://www.adobe.com/favicon.ico", description = "A browser-based design tool for creating graphics, web pages, and video stories.", price = "Free plan, paid plans start at $9.99/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.picmonkey.com/", title = "PicMonkey", icon = "https://www.picmonkey.com/static/favicon.ico", description = "A browser-based photo editing and design tool that allows users to create graphics, logos, and social media posts.", price = "Free trial, paid plans start at $7.99/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.beFunky.com/", title = "BeFunky", icon = "https://www.befunky.com/favicons/favicon.ico", description = "A browser-based photo editing and design tool that allows users to create graphics, collages, and social media posts.", price = "Free plan, paid plans start at $4.99/month", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.photopea.com/", title = "Photopea", icon = "https://www.photopea.com/favicon.ico", description = "A browser-based photo editor that can open and edit PSD, XCF, Sketch, XD, and CDR files.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.gimp.org/", title = "GIMP", icon = "https://www.gimp.org/favicon.ico", description = "A free and open-source photo editing software that can be used in your browser with a plugin.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.mockflow.com/", title = "MockFlow", icon = "https://www.mockflow.com/favicon.ico", description = "A web-based wireframing and prototyping tool for creating web and mobile app designs with collaboration features.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.lucidchart.com/", title = "Lucidchart", icon = "https://www.lucidchart.com/public/favicon-32x32.png", description = "A browser-based diagramming tool that supports Windows, Linux, and Mac.", price = "Completely Free", category = "Diagramming", platform = "Browser-Based" }
        , { url = "https://www.grammarly.com/", title = "Grammarly", icon = "https://www.grammarly.com/favicon.ico", description = "A writing assistant tool that helps you improve your grammar, spelling, and punctuation.", price = "Completely Free", category = "Writing", platform = "Browser-Based" }
        , { url = "https://www.scribblemaps.com/", title = "Scribble Maps", icon = "https://www.scribblemaps.com/favicon.ico", description = "A web-based map editor that allows you to create custom maps and add markers, lines, and shapes.", price = "Completely Free", category = "Mapping", platform = "Browser-Based" }
        , { url = "https://www.hemingwayapp.com/", title = "Hemingway Editor", icon = "https://www.hemingwayapp.com/favicon.ico", description = "A web-based writing tool that helps you simplify your writing by highlighting common errors and suggesting improvements.", price = "Completely Free", category = "Writing", platform = "Browser-Based" }
        , { url = "https://www.autodraw.com/", title = "AutoDraw", icon = "https://www.autodraw.com/images/favicon.ico", description = "A browser-based drawing tool that uses machine learning to help you draw simple illustrations.", price = "Completely Free", category = "Drawing", platform = "Browser-Based" }
        , { url = "https://unsplash.com/", title = "Unsplash", icon = "https://unsplash.com/favicon.ico", description = "A platform for high-resolution, royalty-free stock images.", price = "Completely Free", category = "Photography", platform = "Browser-Based" }
        , { url = "https://www.pexels.com/", title = "Pexels", icon = "https://www.pexels.com/favicon.ico", description = "A free stock photo and video platform.", price = "Completely Free", category = "Photography", platform = "Browser-Based" }
        , { url = "https://www.producthunt.com/", title = "Product Hunt", icon = "https://ph-static.imgix.net/ph-ios-icon.png?auto=format&fit=crop&h=180&w=180", description = "A platform for discovering and sharing new products, apps, and services.", price = "Completely Free", category = "Product Discovery", platform = "Browser-Based" }
        , { url = "https://pixlr.com/", title = "Pixlr", icon = "https://pixlr.com/ico/favicon.ico", description = "A browser-based photo editor that offers a range of tools and effects.", price = "Completely Free", category = "Photo Editing", platform = "Browser-Based" }
        , { url = "https://www.mentimeter.com/", title = "Mentimeter", icon = "https://www.mentimeter.com/favicon.ico", description = "A web-based interactive presentation tool that allows audience members to participate in real-time polls, quizzes, and surveys.", price = "Freemium", category = "Presentations", platform = "Browser-Based" }
        , { url = "https://www.sketchpad.app/", title = "Sketchpad", icon = "https://www.sketchpad.app/favicon.ico", description = "A browser-based drawing and painting app with a variety of tools and features.", price = "Completely Free", category = "Drawing", platform = "Browser-Based" }
        , { url = "https://www.fotor.com/", title = "Fotor", icon = "https://www.fotor.com/favicon.ico", description = "A web-based photo editor with advanced editing tools and a variety of templates and designs.", price = "Freemium", category = "Photo Editing", platform = "Browser-Based" }
        , { url = "https://www.easel.ly/", title = "Easel.ly", icon = "https://www.easel.ly/favicon.ico", description = "A web-based infographic design tool with a library of templates and elements.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.tablesgenerator.com/", title = "Tables Generator", icon = "https://www.tablesgenerator.com/favicon.ico", description = "A web-based tool for generating tables in various formats including LaTeX, Markdown, and HTML.", price = "Completely Free", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://airtable.com/", title = "Airtable", icon = "https://airtable.com/favicon.ico", description = "A web-based spreadsheet and database tool for organizing information and collaborating with others.", price = "Freemium", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://www.drawisland.com/", title = "Draw Island", icon = "https://www.drawisland.com/favicon.ico", description = "A browser-based drawing tool with a variety of brushes and colors.", price = "Completely Free", category = "Drawing", platform = "Browser-Based" }
        , { url = "https://app.getmetastream.com/", title = "Metastream", icon = "https://app.getmetastream.com/favicon.ico", description = "A browser extension for watching streaming video with friends and family.", price = "Completely Free", category = "Video Streaming", platform = "Browser-Based" }
        , { url = "https://www.photojoiner.net/", title = "PhotoJoiner", icon = "https://www.photojoiner.net/images/favicon-16x16.png", description = "A web-based tool for combining multiple photos into a single image.", price = "Completely Free", category = "Photo Editing", platform = "Browser-Based" }
        , { url = "https://www.flaticon.com/", title = "Flaticon", icon = "https://www.flaticon.com/favicon.ico", description = "A web-based tool for finding and downloading free icons in various formats.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://whimsical.com/", title = "Whimsical", icon = "https://whimsical.com/favicon.ico", description = "A web-based tool for creating flowcharts, wireframes, and sticky notes.", price = "Freemium", category = "Diagramming", platform = "Browser-Based" }
        , { url = "https://www.draw.io/", title = "Draw.io", icon = "https://www.draw.io/favicon.ico", description = "A web-based diagramming tool with a variety of templates and shapes.", price = "Completely Free", category = "Diagramming", platform = "Browser-Based" }
        , { url = "https://www.lunapic.com/editor/", title = "LunaPic", icon = "https://www.lunapic.com/favicon.ico", description = "A web-based photo editor with advanced editing tools and effects.", price = "Completely Free", category = "Photo Editing", platform = "Browser-Based" }
        , { url = "https://www.vectorizer.io/", title = "Vectorizer", icon = "https://www.vectorizer.io/favicon.ico", description = "A web-based tool for converting raster images to vector graphics.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.i2ocr.com/", title = "i2OCR", icon = "https://www.i2ocr.com/favicon.ico", description = "A web-based OCR tool for converting scanned documents and images to editable text.", price = "Completely Free", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://www.moqups.com/", title = "Moqups", icon = "https://www.moqups.com/favicon.ico", description = "A web-based tool for creating wireframes, mockups, and prototypes.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://remove.bg/", title = "Remove.bg", icon = "https://remove.bg/favicon.ico", description = "A web-based tool for removing the background from images.", price = "Freemium", category = "Photo Editing", platform = "Browser-Based" }
        , { url = "https://slides.com/", title = "Slides", icon = "https://slides.com/favicon.ico", description = "A web-based presentation tool with a variety of templates and themes.", price = "Freemium", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://www.beautiful.ai/", title = "Beautiful.ai", icon = "https://www.beautiful.ai/favicon.ico", description = "A web-based tool for creating beautiful and professional presentations.", price = "Freemium", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://www.iconfinder.com/editor/", title = "Iconfinder Editor", icon = "https://www.iconfinder.com/favicon.ico", description = "A web-based tool for creating custom icons and editing existing ones.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.kapwing.com/", title = "Kapwing", icon = "https://www.kapwing.com/favicon.ico", description = "A web-based tool for creating and editing video and GIFs.", price = "Freemium", category = "Video Editing", platform = "Browser-Based" }
        , { url = "https://www.gravit.io/", title = "Gravit Designer", icon = "https://www.gravit.io/favicon.ico", description = "A web-based vector graphics editor with a variety of design tools and features.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.freepik.com/editor", title = "Freepik Editor", icon = "https://www.freepik.com/favicon.ico", description = "A web-based tool for creating and editing graphics, illustrations, and designs.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.logaster.com/logo-maker/", title = "Logaster Logo Maker", icon = "https://www.logaster.com/favicon.ico", description = "A web-based tool for creating professional logos and branding assets.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://getwaves.io/", title = "Get Waves", icon = "https://getwaves.io/favicon.ico", description = "A web-based tool for generating custom SVG waves and backgrounds.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://vecteezy.com/editor", title = "Vecteezy Editor", icon = "https://vecteezy.com/favicon.ico", description = "A web-based vector graphics editor with a large library of free vectors and illustrations.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.codeply.com/", title = "Codeply", icon = "https://www.codeply.com/assets/images/favicon/favicon.ico", description = "A web-based tool for building and testing responsive web designs with HTML, CSS, and JavaScript.", price = "Completely Free", category = "Web Development", platform = "Browser-Based" }
        , { url = "https://pablo.buffer.com/", title = "Buffer Pablo", icon = "https://pablo.buffer.com/favicon.ico", description = "A web-based tool for creating social media graphics with pre-made templates and designs.", price = "Freemium", category = "Social Media", platform = "Browser-Based" }
        , { url = "https://brandcolors.net/", title = "BrandColors", icon = "https://brandcolors.net/favicon.ico", description = "A web-based tool that provides color codes for major brand logos and palettes.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.fluidui.com/", title = "Fluid UI", icon = "https://www.fluidui.com/favicon.ico", description = "A web-based tool for creating interactive wireframes and prototypes for web and mobile apps.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://imgflip.com/memegenerator", title = "Imgflip Meme Generator", icon = "https://imgflip.com/favicon.ico", description = "A web-based tool for creating and customizing memes.", price = "Completely Free", category = "Humor", platform = "Browser-Based" }
        , { url = "https://www.mailinator.com/", title = "Mailinator", icon = "https://www.mailinator.com/favicon.ico", description = "A web-based disposable email service for testing and verifying email workflows.", price = "Completely Free", category = "Email", platform = "Browser-Based" }
        , { url = "https://animista.net/", title = "Animista", icon = "https://animista.net/favicon.ico", description = "A web-based tool for generating CSS animations and transitions.", price = "Completely Free", category = "Web Development", platform = "Browser-Based" }
        , { url = "https://excalidraw.com/", title = "Excalidraw", icon = "https://excalidraw.com/favicon.ico", description = "A web-based tool for creating diagrams and sketches with a hand-drawn feel.", price = "Completely Free", category = "Diagraming", platform = "Browser-Based" }
        , { url = "https://kuku.lu/", title = "Kuku", icon = "https://kuku.lu/favicon.ico", description = "A web-based tool for scheduling meetings and events with multiple attendees.", price = "Completely Free", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://www.remix.com/", title = "Remix", icon = "https://www.remix.com/favicon.ico", description = "A web-based platform for planning and designing urban mobility solutions.", price = "Contact for Pricing", category = "Transportation", platform = "Browser-Based" }
        , { url = "https://www.photojoiner.net/", title = "PhotoJoiner", icon = "https://www.photojoiner.net/favicon.ico", description = "A web-based tool for creating photo collages with multiple images.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.json-generator.com/", title = "JSON Generator", icon = "https://www.json-generator.com/favicon.ico", description = "A web-based tool for generating sample JSON data with custom templates.", price = "Completely Free", category = "Web Development", platform = "Browser-Based" }
        , { url = "https://codepen.io/", title = "CodePen", icon = "https://codepen.io/favicon.ico", description = "A web-based code editor and community for front-end developers.", price = "Freemium", category = "Web Development", platform = "Browser-Based" }
        , { url = "https://www.pixilart.com/", title = "Pixilart", icon = "https://www.pixilart.com/favicon.ico", description = "A web-based pixel art editor with a social community and collaboration features.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.powtoon.com/", title = "Powtoon", icon = "https://www.powtoon.com/favicon.ico", description = "A web-based animation tool for creating animated videos and presentations with pre-made templates.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://code.visualstudio.com/docs/languages/javascript", title = "Visual Studio Code", icon = "https://code.visualstudio.com/favicon.ico", description = "A web-based code editor and IDE with support for various programming languages and extensions.", price = "Completely Free", category = "Web Development", platform = "Browser-Based" }
        , { url = "https://www.drawspace.com/", title = "Drawspace", icon = "https://www.drawspace.com/favicon.ico", description = "A web-based art education platform with online drawing lessons and tutorials.", price = "Freemium", category = "Design", platform = "Browser-Based" }
        , { url = "https://pixabay.com/", title = "Pixabay", icon = "https://pixabay.com/favicon.ico", description = "A web-based platform for finding and downloading high-quality, free-to-use images and videos.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://awwapp.com/", title = "Aww App", icon = "https://awwapp.com/favicon.ico", description = "A web-based whiteboard app for collaboration and brainstorming with real-time drawing and commenting features.", price = "Freemium", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://vectr.com/", title = "Vectr", icon = "https://vectr.com/favicon.ico", description = "A web-based vector graphics editor with collaboration features and export options.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://tinkercad.com/", title = "Tinkercad", icon = "https://www.tinkercad.com/assets/favicon.ico", description = "A web-based 3D design tool for creating models, circuits, and prototypes with pre-made shapes and templates.", price = "Completely Free", category = "Design", platform = "Browser-Based" }
        , { url = "https://www.desmos.com/calculator", title = "Desmos", icon = "https://www.desmos.com/favicon.ico", description = "A web-based graphing calculator for plotting equations, functions, and data sets with real-time collaboration features.", price = "Completely Free", category = "Mathematics", platform = "Browser-Based" }
        , { url = "https://www.getpostman.com/", title = "Postman", icon = "https://www.getpostman.com/favicon.ico", description = "A web-based API testing and collaboration tool with a user-friendly interface.", price = "Freemium", category = "Web Development", platform = "Browser-Based" }
        , { url = "https://www.remnote.io/", title = "RemNote", icon = "https://www.remnote.io/favicon.ico", description = "A web-based note-taking app with spaced repetition and knowledge management features.", price = "Freemium", category = "Productivity", platform = "Browser-Based" }
        , { url = "https://repl.it", title = "Repl.it", icon = "https://repl.it/favicon.ico", description = "An online IDE for many languages including Python, Java, and Ruby.", price = "Freemium", category = "Development", platform = "Browser-based" }
        , { url = "https://www.rollapp.com/apps", title = "RollApp", icon = "https://www.rollapp.com/assets/images/favicons/favicon.ico", description = "An online application virtualization platform with a variety of apps available.", price = "Freemium", category = "Productivity", platform = "Browser-based" }
        , { url = "https://online-go.com/", title = "Online-Go.com", icon = "https://online-go.com/favicon.ico", description = "A browser-based platform for playing the ancient board game of Go.", price = "Completely Free", category = "Gaming", platform = "Browser-based" }
        , { url = "https://www.youidraw.com/apps/painter/", title = "YouiDraw Painter", icon = "https://www.youidraw.com/favicon.ico", description = "A browser-based vector graphic design tool with a range of features.", price = "Freemium", category = "Design", platform = "Browser-based" }
        , { url = "https://app.creately.com/diagram/create", title = "Creately", icon = "https://app.creately.com/favicon.ico", description = "A collaborative diagramming tool with a wide range of templates.", price = "Freemium", category = "Diagramming", platform = "Browser-based" }
        , { url = "https://typatone.com/", title = "Typatone", icon = "https://typatone.com/favicon.ico", description = "A browser-based music making tool that turns text into melodies.", price = "Completely Free", category = "Music", platform = "Browser-based" }
        , { url = "https://app.pics.io/", title = "Pics.io", icon = "https://app.pics.io/favicon.ico", description = "A cloud-based image management platform with editing tools and team collaboration features.", price = "Freemium", category = "Photography", platform = "Browser-based" }
        , { url = "https://carrd.co/", title = "Carrd", icon = "https://carrd.co/favicon.ico", description = "A simple and easy-to-use platform for creating one-page websites.", price = "Freemium", category = "Web Development", platform = "Browser-based" }
        , { url = "https://getkap.co/", title = "Kap", icon = "https://getkap.co/favicon.ico", description = "A screen capture and screen recording tool for macOS.", price = "Completely Free", category = "Productivity", platform = "Mac" }
        , { url = "https://hyper.is/", title = "Hyper", icon = "https://hyper.is/favicon.ico", description = "A terminal emulator built with web technologies, customizable with plugins and themes.", price = "Completely Free", category = "Development", platform = "Windows, Mac, Linux" }
        , { url = "https://logoly.pro/", title = "Logoly", icon = "https://logoly.pro/assets/favicon.ico", description = "A simple online logo maker with thousands of customizable templates.", price = "Freemium", category = "Design", platform = "Browser-based" }
        ]
    }


shadow =
    Border.shadow
        { blur = 10
        , size = 1
        , offset = ( 4, 2 )
        , color = black
        }


type Msg
    = UpdateNum Int


webApp data =
    let
        myTitle =
            Element.el
                [ Font.size 24
                , Font.color white
                ]
            <|
                Element.paragraph
                    [ Font.bold
                    ]
                    [ Element.el [] <| text data.title ]

        imageSize =
            75

        myIcon =
            Element.newTabLink
                [ Border.width 1
                , padding 5
                , Border.rounded 5
                , Background.color <| grey 80
                , shadow
                ]
                { label =
                    Element.image
                        [ width <| px imageSize
                        , height <| px imageSize
                        ]
                        { src = data.icon
                        , description = ""
                        }
                , url = data.url
                }

        myPrice =
            Element.paragraph [] [ text data.price ]

        myDescription =
            Element.paragraph [] [ text data.description ]

        myCategory =
            Element.paragraph [] [ text "Category: ", text data.category ]

        myPlatform =
            Element.paragraph [] [ text data.platform ]

        myUrl =
            Element.paragraph [ Font.color blue, alignBottom ]
                [ Element.newTabLink []
                    { label = text data.url
                    , url = data.url
                    }
                ]
    in
    Element.el
        [ Background.color <| grey 100
        , padding 15
        , Font.size 15
        , Border.rounded 5
        , width fill
        , shadow
        ]
    <|
        Element.wrappedRow
            [ spacing 30
            , width fill
            ]
            [ Element.column
                [ spacing 20
                , width <| px 150

                --, Background.color red
                , height fill
                ]
                [ myTitle
                , myIcon
                ]
            , Element.column
                [ spacing 25
                , width <| px 250

                --, Background.color red
                , height fill
                , shadow
                , Background.color <| grey 120
                , padding 15
                , Border.rounded 5
                ]
                [ myCategory
                , myPrice
                , myPlatform
                ]
            , Element.column
                [ width fill

                --, Background.color red
                , height fill
                , Background.color <| grey 120
                , Border.rounded 5
                , padding 15
                , shadow
                ]
                [ myDescription
                , myUrl
                ]
            ]


update msg model =
    model


view : Model -> Html Msg
view model =
    Element.layout
        [ padding 50
        , Background.color <| grey 40
        ]
    <|
        Element.column
            [ centerX
            , centerY
            , spacing 10
            ]
        <|
            [ Element.column
                [ spacing 15
                , width fill
                ]
              <|
                List.map webApp <|
                    List.sortBy .title <|
                        model.webApps
            ]


red =
    rgb 1 0 0


green =
    rgb 0 1 0


blue =
    rgb 0 0 1


purple =
    rgb 1 0 1


grey x =
    rgb255 x x x


black =
    grey 0


white =
    grey 255
