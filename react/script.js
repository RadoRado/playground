var React = require("react");
var marked = require("marked");

var data = [
  {
    "author": "RadoRado",
    "text": "First Comment"
  },
  {
    "author": "RadoRado",
    "text": "Second **comment**"
  }
];

var Comment = React.createClass({
  render: function() {
    var rawMarkup = marked(this.props.children.toString());

    return (
      <div className="comment">
        <h2 className="commentAuthor">
        {this.props.author}
        </h2>
        <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
      </div>
    );
  }
});

var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(comment => {
      return (
        <Comment author={comment.author}>
          {comment.text}
        </Comment>
      );
    });

    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});

var CommentForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var authorRef = React.findDOMNode(this.refs.author);
    var textRef = React.findDOMNode(this.refs.text);
    
    this.props.onCommentSubmit({
      "author": authorRef.value.trim(),
      "text": textRef.value.trim()
    });
    
    console.log(authorRef.value);
    console.log(textRef.value);  

    authorRef.value = "";
    textRef.value = "";
  },
  render: function() {
    return (
      <form className="commentForm" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Your name" ref="author"/>
        <input type="text" placeholder="Say something..." ref="text" />
        <input type="submit" value="Post" />
      </form>
    );
  }
});


var CommentBox = React.createClass({
  getInitialState: function() {
    return { data: [] };
  },
  componentDidMount: function() {
    this.setState({ data: data });
  },
  handleCommentSubmit: function(comment) {
    data.push(comment)
    this.setState({ data: data });
  },
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit} />
      </div> );
  }
});

React.render(
  <CommentBox />,
  document.getElementById("content")
);
