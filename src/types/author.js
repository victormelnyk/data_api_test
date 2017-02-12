const graphql = require('graphql');
const data = require('../data/authors.json');

const author = new graphql.GraphQLObjectType({
  name: 'Author',
  fields: {
    id: {
      type: graphql.GraphQLInt
    },
    name: {
      type: graphql.GraphQLString
    }
  }
});

const authorQuery = new graphql.GraphQLObjectType({
  name: 'AuthorQuery',
  fields: {
    author: {
      type: author,
      args: {
        id: {
          type: graphql.GraphQLInt
        }
      }
    },
    resolve(root, args) {
      return data[args.id];
    }
  }
});

const schema = new graphql.GraphQLSchema({
  query: authorQuery
});

module.exports = schema;
