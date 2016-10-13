import React from 'react';
import QuestionList from './QuestionList'

const App = props => {
  return (
    <div>
      <LocationList
        locations={props.data}/>
    </div>
  )
};

export default App;
