<!-- Tokens -->
<div class="tab-pane page-tokens active" ng-if="globalService.currentTab==globalService.tabs.tokens.id">

  <!-- TOP: Tokens -->
  <section class="row">
    <div class="col-xs-12">
      <h2> Tokens </h2>
      <p> Use this tab to <strong>Send any tokens on the Ethereum network</strong>.</p>
    </div>
  </section>
  <br />

  @@if (site === 'cx' ) {
    <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>
  }
  @@if (site === 'mew' ) {
    <wallet-decrypt-drtv></wallet-decrypt-drtv>
  }
  <!-- / TOP: Tokens -->

  <!-- BOTTOM: Tokens -->
  <section class="row" ng-show="wallet!=null" ng-controller='theDaoCtrl'>
    <hr />
    <div class="col-sm-4">
      <h4> Account Information </h4>
      <div>
        <div id="addressIdenticon" title="Address Indenticon" blockie-address="{{wallet.getAddressString()}}" watch-var="wallet"></div>
        <br />
        <p> Account Address:
          <br /> <strong style="padding-left: 1em; display: block;" class="mono word-wrap">{{wallet.getChecksumAddressString()}}</strong>
        </p>
        <p> Account Balance:
          <br />
          <strong class="text-primary" style="margin-left: 1em"> {{etherBalance}} Ether </strong>
          <br />
          <strong style="margin-left: 1em"> {{token.dao.balance}} DAO</strong>
          <br />
          <strong style="margin-left: 1em"> {{token.dgd.balance}} DGD</strong>
          <br />
          <strong style="margin-left: 1em"> {{token.dgdb.balance}} DGD Badges</strong>
          <br />
          <strong style="margin-left: 1em"> {{token.mrk.balance}} MKR</strong>
          <br />
          <strong style="margin-left: 1em"> {{token.unicorn.balance}} Unicorns</strong><br />
        </p>

        </p>
        </p>
        <p> Equivalent Values:
          <br />
          <strong style="margin-left: 1em"> {{usdBalance}} USD </strong>
          <br />
          <strong style="margin-left: 1em"> {{eurBalance}} EUR </strong>
          <br />
          <strong style="margin-left: 1em"> {{btcBalance}} BTC </strong>
        </p>
        <p> See Transaction History:
          <br />
          <a href="https://etherscan.io/address/{{wallet.getAddressString()}}" target="_blank">https://etherscan.io/address/ {{wallet.getAddressString()}}</a>
        </p>
      </div>
      <br />
      <div class="well">
        <p> MyEtherWallet is a free, open-source service dedicated to your privacy and security. The more donations we receive, the more time we spend creating new features, listening to your feedback, and giving you what you want. We are just two people trying to change the world. Help us?</p>
        <a class="btn btn-primary btn-block" ng-click="onDonateClick()">DONATE</a>
        <div class="text-success text-center marg-v-sm"><strong ng-show="tx.donate"> THANK YOU!!! </strong></div>
      </div>
    </div>

    <div class="col-sm-8">

      <!-- Send DAO Tokens -->
      <section class="daoGetTokens clearfix" ng-show="curTab=='send'">
        <h4>Send Tokens</h4>
        <div class="form-group col-xs-10">
          <label> To Address: </label>
          <input class="form-control" type="text" placeholder="0x7cB57B5A97eAbe94205C07890BE4c1aD31E486A8" ng-model="tokenTx.to" ng-change="validateAddress()"/>
          <div ng-bind-html="validateAddressStatus"></div>
        </div>
        <div class="col-xs-2 address-identicon-container">
          <div id="addressIdenticon" title="Address Indenticon" blockie-address="{{tokenTx.to}}" watch-var="tokenTx.to"></div>
        </div>
        <div class="form-group col-xs-12">
          <label>
            Amount to Send:
            <br />
          </label>
          <input class="form-control" type="text" placeholder="Amount" ng-model="tokenTx.value"/>
          <div class="radio">
            <label><input type="radio" name="currencyRadio" value="dao" ng-model="tokenTx.unit"/>DAO </label>
            <label><input type="radio" name="currencyRadio" value="dao" ng-model="tokenTx.unit"/>DGD </label>
            <label><input type="radio" name="currencyRadio" value="dao" ng-model="tokenTx.unit"/>DGDb </label>
            <label><input type="radio" name="currencyRadio" value="dao" ng-model="tokenTx.unit"/>MKR </label>
            <label><input type="radio" name="currencyRadio" value="dao" ng-model="tokenTx.unit"/>🦄 </label>
            <label><input type="radio" name="currencyRadio" value="dao" ng-model="tokenTx.unit"/> Custom </label>
          </div>

          <section class="custom-token-fields well">
            <div class="form-group">
              <label> Address: </label>
              <input class="form-control" type="text" />
            </div>
            <div class="form-group">
              <label> Token Name: </label>
              <input class="form-control" type="text" />
            </div>
            <div class="form-group">
              <label> Token Symbol: </label>
              <input class="form-control" type="text" />
            </div>
            <div class="form-group">
              <label> Decimals: </label>
              <input class="form-control" type="text" />
            </div>
            <div class="form-group">
              <div class="btn btn-info"> Save </div>
            </div>
          </section>

          <div class="form-group">
            <label> Gas: </label>
            <input class="form-control" type="text" ng-model="tx.gasLimit"/>
          </div>
          <!-- / advanced option panel -->
        </div>
        <div class="form-group col-xs-12">
          <a class="btn btn-info btn-block" ng-click="generateTokenTx()">GENERATE TRANSACTION</a>
        </div>
        <div class="col-xs-12">
           <div ng-bind-html="validateTxStatus"></div>
        </div>
        <div class="form-group col-xs-12" ng-show="showRaw">
          <label> Raw Transaction </label>
          <textarea class="form-control" rows="4" disabled >{{rawTx}}</textarea>
          <label> Signed Transaction </label>
          <textarea class="form-control" rows="4" disabled >{{signedTx}}</textarea>
        </div>
        <div class="form-group col-xs-12" ng-show="showRaw">
          <a class="btn btn-primary btn-block" data-toggle="modal" data-target="#sendTransaction">SEND TRANSACTION</a>
        </div>
        <div class="form-group col-xs-12" ng-bind-html="sendTxStatus"></div>
      </section>
      <!--/ Send DAO Tokens -->



    </div>
  <!-- / BOTTOM: Tokens -->


  <!-- Send Modal -->
  <div class="modal fade" id="sendTransaction" tabindex="-1" role="dialog" aria-labelledby="sendTransactionLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h3 class="modal-title" id="myModalLabel"> <strong class="text-danger">Warning!</strong></h3>
        </div>
        <div class="modal-body">
          <h4>
            You are about to send
            <strong id="confirmAmount" class="text-primary"> {{tokenTx.value}} </strong>
            <strong id="confirmCurrancy" class="text-primary"> DAO Token </strong>
            to address
            <strong id="confirmAddress" class="text-primary"> {{tokenTx.to}} </strong>
          </h4>
          <h4> Are you <span class="text-underline">sure</span> you want to do this?</h4>
          <p><em> NOTE: If you encounter a gas error (account doesn't exist or balance too low) then you need to add ETH to your account) to cover the cost of sending DAO tokens.</em></p>

        </div>
        <div class="modal-footer text-center">
          <button type="button" class="btn btn-default" data-dismiss="modal">No, get me out of here!</button>
          <button type="button" class="btn btn-primary" ng-click="sendTx()">Yes, I am sure! Make transaction.</button>
        </div>
      </div>
    </div>
  </div>
  <!-- / Send Modal -->
</section>
  <!-- / Vote Modal -->


</div>
<!-- / The DAO -->

