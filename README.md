<a href="https://codeclimate.com/github/ninjapanzer/React-Chat"><img src="https://codeclimate.com/github/ninjapanzer/React-Chat/badges/gpa.svg" /></a>
#### A ReactJS Chat Example

The point of this is to see what a prototype of a chat application in ReactJS would feel like.

**My key identifiers are:**

1. Is the code easy to follow
2. How much duplication will I create
3. Does JSX grow ugly fast?
4. Can I achieve single flow data binding

**My conclusions thus far:**

1. The code is pretty easy to follow because a lot of it is very similar and there is little *magic*
2. Right now there is a lot of duplication. I have many repeated dispatchers and store boilerplate. To be honest though having this kind of duplication makes it feel very frameworky and repeatable is good
3. JSX when iterating is very ugly always wrapping output in a map to get repeated items. As a side thought I have considered making the store responsible for iterating but I think the biggest goal is to just break up some of these sections into functions. It is very nice to keep the markup so close to the code. The style too sometimes.
4. I have successfully achieved single flow data binding. It was very easy in fact. Near the bottom of the data we add messages to a channel and trigger a redraw when the item is added to the collection. This is instantanious. I have not load tests it yet with a bunch of messages but in practice we could always enforce a storage history so no matter what we don't have too many messages on screen.

**I love React and Backbone together**

#### Running this

##### Globals
I am assuming that you have node and redis installed to build this project. Although I am not quite using redis yet the dev server spins up redis.

You will need these global node modules
- foreman
- webpack, webpack-cli
- coffeescript

Project setup:

- `bower install`
- `npm install`
- test with `npm run build`
- run `npm start`
- `open http://localhost:8080`

Configuration. This does not consume an api right now and uses local fakedata. You will find it in the fakedata folder. Feel free to expand the defitions to add more channels and users. 
