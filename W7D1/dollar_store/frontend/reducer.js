const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case: "SWITCH_CURRENCY":
                    return [
                      ...state,
                      action.rates,
                      action.baseCurrency
                    ];
  }
};

export default reducer;
