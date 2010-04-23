{include file='header'}
<script type="text/javascript" src="{@RELATIVE_WCF_DIR}js/MultiPagesLinks.class.js"></script>

<div class="mainHeadline">
	<img src="{@RELATIVE_WCF_DIR}icon/vhostContainerL.png" alt="" />
	<div class="headlineContainer">
		<h2>{lang}cp.acp.vhostContainer.list{/lang}</h2>
	</div>
</div>

{if $deletedVhosts}
	<p class="success">{lang}cp.acp.vhostContainer.delete.success{/lang}</p>	
{/if}

<div class="contentHeader">
	{pages print=true assign=pagesLinks link="index.php?page=vhostContainerList&pageNo=%d&sortField=$sortField&sortOrder=$sortOrder&packageID="|concat:PACKAGE_ID:SID_ARG_2ND_NOT_ENCODED}
	<div class="largeButtons">
		<ul>
			<li><a href="index.php?form=vhostContainerAdd&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}" title="{lang}cp.acp.vhostContainer.add{/lang}"><img src="{@RELATIVE_WCF_DIR}icon/vhostContainerAddM.png" alt="" /> <span>{lang}cp.acp.vhostContainer.add{/lang}</span></a></li>
			{if $additionalLargeButtons|isset}{@$additionalLargeButtons}{/if}			
		</ul>
	</div>
</div>

{if $vhosts|count}
	<div class="border titleBarPanel">
		<div class="containerHead"><h3>{lang}cp.acp.vhostContainers.list.data{/lang}</h3></div>
	</div>
	<div class="border borderMarginRemove">
		<table class="tableList">
			<thead>
				<tr class="tableHead">
					<th class="columnvhostContainerID{if $sortField == 'vhostContainerID'} active{/if}" colspan="2"><div><a href="index.php?page=vhostContainerList&amp;pageNo={@$pageNo}&amp;sortField=vhostContainerID&amp;sortOrder={if $sortField == 'vhostContainerID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@SID_ARG_2ND}">{lang}cp.acp.vhostContainer.vhostContainerID{/lang}{if $sortField == 'vhostContainerID'} <img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}</a></div></th>
					<th class="columnvhostName{if $sortField == 'vhostContainername'} active{/if}"><div><a href="index.php?page=vhostContainerList&amp;pageNo={@$pageNo}&amp;sortField=vhostContainername&amp;sortOrder={if $sortField == 'vhostContainername' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@SID_ARG_2ND}">{lang}cp.acp.vhostContainer.vhostContainername{/lang}{if $sortField == 'vhostContainername'} <img src="{@RELATIVE_WCF_DIR}icon/sort{@$sortOrder}S.png" alt="" />{/if}</a></div></th>
										
					{if $additionalColumns|isset}{@$additionalColumns}{/if}
				</tr>
			</thead>
			<tbody>
			{foreach from=$vhosts item=vhostContainer}
				<tr class="{cycle values="container-1,container-2"}">
					<td class="columnIcon">
						{if $vhostContainer->canEditvhostContainer}
							<a href="index.php?form=vhostContainerEdit&amp;vhostContainerID={$vhostContainer->vhostContainerID}{@SID_ARG_2ND}"><img src="{@RELATIVE_WCF_DIR}icon/editS.png" alt="" title="{lang}cp.acp.vhostContainer.edit{/lang}" /></a>
						{else}
							<img src="{@RELATIVE_WCF_DIR}icon/editDisabledS.png" alt="" title="{lang}wcf.acp.vhostContainer.edit{/lang}" />
						{/if}
						{if $vhostContainer->canDeletevhostContainer}
							<a onclick="return confirm('{lang}cp.acp.vhostContainer.delete.sure{/lang}')" href="index.php?action=vhostContainerDelete&amp;vhostContainerID={@$vhostContainer->vhostContainerID}{@SID_ARG_2ND}"><img src="{@RELATIVE_WCF_DIR}icon/deleteS.png" alt="" title="{lang}cp.acp.vhostContainer.delete{/lang}" /></a>
						{else}
							<img src="{@RELATIVE_WCF_DIR}icon/deleteDisabledS.png" alt="" title="{lang}wcf.acp.vhostContainer.delete{/lang}" />
						{/if}
						
						{if $additionalButtons[$vhostContainer->vhostContainerID]|isset}{@$additionalButtons[$vhostContainer->vhostContainerID]}{/if}
					</td>
					<td class="columnvhostContainerID columnID">{@$vhostContainer->vhostContainerID}</td>
					<td class="columnvhostContainername columnText">{if $vhostContainer->canEditvhostContainer}<a title="{lang}cp.acp.vhostContainer.edit{/lang}" href="index.php?form=vhostContainerEdit&amp;vhostContainerID={@$vhostContainer->vhostContainerID}{@SID_ARG_2ND}">{$vhostContainer->vhostName}</a>{else}{$vhostContainer->vhostName}{/if}</td>
							
					{if $additionalColumns[$vhostContainer->vhostContainerID]|isset}{@$additionalColumns[$vhostContainer->vhostContainerID]}{/if}
				</tr>
			{/foreach}
			</tbody>
		</table>
	</div>
{/if}

<div class="contentFooter">
	{@$pagesLinks}
	<div class="largeButtons">
		<ul>
			<li><a href="index.php?form=vhostContainerAdd&amp;packageID={@PACKAGE_ID}{@SID_ARG_2ND}" title="{lang}cp.acp.vhostContainer.add{/lang}"><img src="{@RELATIVE_WCF_DIR}icon/vhostContainerAddM.png" alt="" /> <span>{lang}cp.acp.vhostContainer.add{/lang}</span></a></li>
			{if $additionalLargeButtons|isset}{@$additionalLargeButtons}{/if}
		</ul>
	</div>
</div>

{include file='footer'}
